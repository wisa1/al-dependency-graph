page 69850 "Extension-Graph algraph"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Published Application";
    
    
    layout
    {
        area(Content)
        {
            repeater(repeater)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
            group(IFrame)
            {
                usercontrol("Yuml"; "Yuml IFrame")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Test)
            {
                action("Generate Picture for Filter")
                {
                    ApplicationArea = All;
                    
                    trigger OnAction()
                    var
                        Deps: Dictionary of [Text, List of [Text]];
                        RequestQuery: Text;
                    begin
                        FillDependencyDictionary(Deps, Rec);
                        RequestQuery := 'https://yuml.me/diagram/plain/class/' + CreateYumlRequestString(Deps);
                        CurrPage.Yuml.SetUrl(RequestQuery);
                    end;
                }
            }
        }
    }

    local procedure CreateYumlRequestString(Deps: Dictionary of [Text, List of [Text]]): Text
    var
        i, j: Text;
        ResultText: Text;
        StringBuilder: TextBuilder;
        DepList: List of [Text];
    begin
        foreach i in Deps.Keys do begin
            Deps.Get(i, DepList);
            foreach j in DepList do begin
                StringBuilder.Append(Bracket(i));
                StringBuilder.Append('->');
                StringBuilder.Append(Bracket(j));
                StringBuilder.Append(',');
            end;
        end;
        exit(DelChr(Format(StringBuilder), '>', ','));
    end;

    local procedure Bracket(i: Text): Text
    begin
        exit('[' +  i + ']');
    end;

    local procedure FillDependencyDictionary(var Deps: Dictionary of [Text, List of [Text]]; var Rec: Record "Published Application")
    var
        DepList: List of [Text];
        Dependency: Record "Application Dependency";

    begin
        if Rec.FindSet() then repeat
            Clear(DepList);
            if not Deps.ContainsKey(Rec.Name) then 
                Deps.Add(Rec.Name, DepList);

            Dependency.SetRange("Runtime Package ID", Rec."Runtime Package ID");
            if Dependency.FindSet() then repeat
                if not DepList.Contains(Dependency."Dependency Name") then
                    DepList.Add(Dependency."Dependency Name");

            until Dependency.Next() = 0;
        until Rec.Next() = 0;
    end;

}