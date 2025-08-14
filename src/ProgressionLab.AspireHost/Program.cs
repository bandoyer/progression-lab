var builder = DistributedApplication.CreateBuilder(args);

builder.AddProject<Projects.ProgressionLab_Web>("web");

builder.Build().Run();
