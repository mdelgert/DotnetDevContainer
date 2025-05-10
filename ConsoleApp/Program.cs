Console.WriteLine("Welcome to the .NET Dev Container Console Application!");
Console.WriteLine("================================================");
Console.WriteLine($"Current time: {DateTime.Now}");
Console.WriteLine($".NET Version: {Environment.Version}");
Console.WriteLine($"OS Platform: {Environment.OSVersion}");
Console.WriteLine("================================================");

for (int i = 0; i < 60; i++)
{
    Console.WriteLine($"This is message number {i + 1}");
    System.Threading.Thread.Sleep(1000); // Sleep for 1 second
}