module BlocCastHelper
    def in_production?(actively_producing)
        actively_producing ? "In Production" : "Not in Production" 
    end
end
