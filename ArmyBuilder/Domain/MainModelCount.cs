using ArmyBuilder.Domain;
public class MainModelCount
{
    public int First { get; }
    public MainModel Second { get; }

    public MainModelCount(int first, MainModel second)
    {
        First = first;
        Second = second;
    }

    public override string ToString() => $"({First}, {Second})";
}
