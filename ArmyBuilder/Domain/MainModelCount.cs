using ArmyBuilder.Domain;
public class MainModelCount
{
    public int count { get; }
    public MainModel mainModel { get; }

    public MainModelCount(int count, MainModel mainModel)
    {
        this.count = count;
        this.mainModel = mainModel;
    }

    public override string ToString() => $"({count}, {mainModel})";
}
