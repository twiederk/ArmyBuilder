using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Microsoft.Extensions.DependencyInjection;
using ArmyBuilder.ViewModels;
using ArmyBuilder.Domain;
using ArmyBuilder.Dao;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;

namespace ArmyBuilder
{
    public partial class ArmyView : UserControl
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly IArmyBuilderRepository _repository;

        public ArmyView(IServiceProvider serviceProvider, ArmyViewModel armyViewModel)
        {
            _serviceProvider = serviceProvider;
            _repository = serviceProvider.GetRequiredService<IArmyBuilderRepository>();
            InitializeComponent();
            DataContext = armyViewModel;
        }

        private void Print_Click(object sender, RoutedEventArgs e)
        {
            // Define the output file path
            string outputPath = "example.pdf";
            QuestPDF.Settings.License = LicenseType.Community;

            // Create a PDF document
            Document.Create(container =>
            {
                container.Page(page =>
                {
                    page.Size(PageSizes.A4);
                    page.Margin(2, QuestPDF.Infrastructure.Unit.Centimetre);
                    page.PageColor(Colors.White);
                    page.DefaultTextStyle(x => x.FontSize(20));

                    page.Header()
                        .Text("Hello, World!")
                        .SemiBold().FontSize(36).FontColor(Colors.Blue.Medium);

                    page.Content()
                        .Table(table =>
                        {
                            // Define columns
                            table.ColumnsDefinition(columns =>
                            {
                                columns.RelativeColumn();
                                columns.RelativeColumn();
                                columns.RelativeColumn();
                            });

                            // Add header row
                            table.Header(header =>
                            {
                                header.Cell().Element(CellStyle).Text("Header 1");
                                header.Cell().Element(CellStyle).Text("Header 2");
                                header.Cell().Element(CellStyle).Text("Header 3");

                                static IContainer CellStyle(IContainer container)
                                {
                                    return container.DefaultTextStyle(x => x.SemiBold()).Padding(5).Background(Colors.Grey.Lighten3);
                                }
                            });

                            // Add data rows
                            for (int i = 0; i < 9; i++)
                            {
                                table.Cell().Element(CellStyle).Text($"Cell {i + 1}");
                            }

                            static IContainer CellStyle(IContainer container)
                            {
                                return container.Border(1).BorderColor(Colors.Grey.Lighten2).Padding(5);
                            }
                        });

                    page.Footer()
                        .AlignCenter()
                        .Text(x =>
                        {
                            x.Span("Page ");
                            x.CurrentPageNumber();
                        });
                });
            })
            .GeneratePdf(outputPath);

            // Inform the user
            Console.WriteLine("PDF created successfully!");
        }

        private void QuitEdition_Click(object sender, RoutedEventArgs e)
        {
            var armyViewModel = DataContext as ArmyViewModel;
            Army army = armyViewModel.ArmyTreeViewModel.Army;
            army.Points = army.TotalPoints();
            _repository.UpdateArmy(army);

            var startView = _serviceProvider.GetRequiredService<StartView>();
            var startViewModel = startView.DataContext as StartViewModel;
            startViewModel.LoadArmies();

            Window window = Window.GetWindow(this);
            window.Content = _serviceProvider.GetRequiredService<StartView>();
        }

        private void ListBox_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                ListBox listBox = sender as ListBox;
                if (listBox != null)
                {
                    var selectedItem = listBox.SelectedItem;

                    if (selectedItem != null)
                    {
                        DataObject dataObject = new DataObject(selectedItem);
                        DragDrop.DoDragDrop(listBox, dataObject, DragDropEffects.Move);
                    }
                }
            }
        }

        private void ListBox_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            ListBox listBox = sender as ListBox;
            if (listBox != null)
            {
                var selectedMainModel = listBox.SelectedItem as MainModel;
                if (selectedMainModel != null)
                {
                    MainModel clonedMainModel = selectedMainModel.Clone();
                    ArmyViewModel armyViewModel = DataContext as ArmyViewModel;
                    ArmyTreeViewModel armyTreeViewModel = armyViewModel.ArmyTreeViewModel;
                    Army army = armyTreeViewModel.Army;
                    ArmyBuilder.Domain.Unit unit = armyViewModel.CreateUnit(army, clonedMainModel);
                    ArmyTreeNode armyTreeNode = armyTreeViewModel.Root[0];
                    armyTreeNode.AddUnit(unit);
                }
            }
        }


        private void armyTreeNode_Drop(object sender, DragEventArgs dragEvent)
        {
            if (dragEvent.Data.GetDataPresent(typeof(MainModel)))
            {
                MainModel droppedMainModel = dragEvent.Data.GetData(typeof(MainModel)) as MainModel;

                if (droppedMainModel != null)
                {
                    var armyTreeNode = ((FrameworkElement)sender).DataContext as ArmyTreeNode;
                    if (armyTreeNode != null)
                    {
                        MainModel clonedMainModel = droppedMainModel.Clone();
                        Army army = armyTreeNode.Army;
                        var armyViewModel = DataContext as ArmyViewModel;
                        ArmyBuilder.Domain.Unit unit = armyViewModel.CreateUnit(army, clonedMainModel);
                        armyTreeNode.AddUnit(unit);
                    }
                }
            }
        }

        private void unitTreeNode_Drop(object sender, DragEventArgs dragEvent)
        {
            if (dragEvent.Data.GetDataPresent(typeof(MainModel)))
            {
                MainModel droppedMainModel = dragEvent.Data.GetData(typeof(MainModel)) as MainModel;

                if (droppedMainModel != null)
                {
                    var unitTreeNode = ((FrameworkElement)sender).DataContext as UnitTreeNode;
                    if (unitTreeNode != null)
                    {
                        MainModel clonedMainModel = droppedMainModel.Clone();
                        ArmyBuilder.Domain.Unit unit = unitTreeNode.Unit;
                        var armyViewModel = DataContext as ArmyViewModel;
                        armyViewModel.AddMainModel(unit.Id, clonedMainModel);
                        unitTreeNode.AddMainModel(clonedMainModel);
                    }
                }
            }
        }

        private void DeleteUnitButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Tag is UnitTreeNode unitTreeNode)
            {
                var result = MessageBox.Show($"Die Einheit '{unitTreeNode.Name}' löschen?", "Löschung bestätigen", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (result == MessageBoxResult.Yes)
                {
                    var armyViewModel = DataContext as ArmyViewModel;
                    var unit = unitTreeNode.Unit;
                    armyViewModel.DeleteUnit(unit.Id);
                    unitTreeNode.RemoveUnit();
                    unitTreeNode.UpdateTotalPoints();
                }
            }
        }


        private void DeleteMainModelButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Tag is MainModelTreeNode mainModelTreeNode)
            {
                var result = MessageBox.Show($"Das Model '{mainModelTreeNode.Name}' löschen?", "Löschung bestätigen", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (result == MessageBoxResult.Yes)
                {
                    var armyViewModel = DataContext as ArmyViewModel;
                    var mainModel = mainModelTreeNode.MainModel;
                    int unitId = mainModelTreeNode.Unit.Id;
                    armyViewModel.DeleteMainModelFromUnit(unitId, mainModel.Id);
                    mainModelTreeNode.RemoveMainModel();
                    mainModelTreeNode.UpdateTotalPoints();
                }
            }
        }

        private void mainModelTreeNode_IncreaseCount(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Tag is MainModelTreeNode mainModelTreeNode)
            {
                var mainModel = mainModelTreeNode.MainModel;
                mainModel.IncreaseCount();
                UpdateMainModelCount(mainModelTreeNode, mainModel);
            }
        }

        private void mainModelTreeNode_DecreaseCount(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Tag is MainModelTreeNode mainModelTreeNode)
            {
                var mainModel = mainModelTreeNode.MainModel;
                mainModel.DecreaseCount();
                UpdateMainModelCount(mainModelTreeNode, mainModel);
            }
        }

        private void UpdateMainModelCount(MainModelTreeNode mainModelTreeNode, MainModel mainModel)
        {
            var armyViewModel = DataContext as ArmyViewModel;
            armyViewModel.UpdateMainModelCount(mainModelTreeNode.Unit.Id, mainModel.Id, mainModel.Count);
            mainModelTreeNode.UpdateCount();
        }

    }
}