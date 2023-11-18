declare Xl = [1 2 3 4]


declare 
fun {Filter Xs F}
   case Xs
   of nil then nil
   [] X|Xr andthen {F X} then X|{Filter Xr F}
   [] X|Xr then {Filter Xr F}
   end
end

{Filter Xl fun {$ A} A<3 end}