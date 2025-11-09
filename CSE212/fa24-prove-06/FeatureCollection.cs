namespace prove_06;

//This is the structure for the FeatureCollection
public class FeatureCollection {
    
    public Feature[]? Features { get; set; }
}

public class Feature
{
    // public string? Type { get; set; }
    public Property? Properties { get; set; }
}

public class Property{
    //the information we need
    public double? Mag { get; set; }
    public string? Place { get; set; }
    
    //All the other information, just to practice 
     // public double? Time { get; set; }
     // public double? Updated { get; set; }
     // public string? Tz { get; set; }
     // public string? Url { get; set; }
     // public string? Detail { get; set; }
     // public int? Felt { get; set; }
     // public float? Cdi { get; set; }
     // public string? Mmi { get; set; }
     // public string? Alert { get; set; }
     // public string? Status { get; set; }
     // public int? Tsunami { get; set; }
     // public int? Sig { get; set; }
     // public string? Net { get; set; }
     // public string? Code { get; set; }
     // public string? Ids { get; set; }
     // public string? Sources { get; set; }
     // public string? Types { get; set; }
     // public int? Nst { get; set; }
     // public float? Dmin { get; set; }
     // public float? Rms { get; set; }
     // public float? Gap { get; set; }
     // public string? MagType { get; set; }
     // public string? Type { get; set; }
     // public string? Title { get; set; }
}