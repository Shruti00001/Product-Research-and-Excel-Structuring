// Power Query (M): Data > Get Data > From Text/CSV, then Advanced Editor and paste.
// Replace the file path with your own.
let
    Source   = Csv.Document(File.Contents("C:\path\to\data\products.csv"), [Delimiter=",", Encoding=65001]),
    Promoted = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    Typed    = Table.TransformColumnTypes(Promoted, {{"product_id", Int64.Type}, {"price", type number},
                {"rating", type number}, {"reviews", Int64.Type}, {"sentiment_score", type number}}),
    Trimmed  = Table.TransformColumns(Typed, {{"platform", Text.Trim, type text}, {"category", Text.Trim, type text}}),
    NoDupes  = Table.Distinct(Trimmed, {"product_name", "platform"}),
    Bands    = Table.AddColumn(NoDupes, "price_band", each if [price] < 1000 then "Budget"
                else if [price] < 3000 then "Mid" else "Premium", type text)
in
    Bands
