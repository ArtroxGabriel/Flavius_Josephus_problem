declare Map Gen

fun {Map F Xl}
   case Xl
   of nil then nil
   [] X|Xs then {F X}|{Map F Xs} end
end

fun {Gen L H}
   {Delay 1000}
   if L>H then nil else L | {Gen L+1 H} end
end

% ================END=====================
local Xs Ys in
   thread Xs = {Gen 1 10} end
   thread Ys = {Map fun {$ X} X*X end Xs}  end
   
   {Browse Ys}
end

local B in
   thread B = true end
   if B then {Browse yes} end
end


local X Y in
   local X1 Y1 S1 S2 S3 in
      thread
	 try X1=1 S1=ok catch _ then S1=error end
      end
      thread
	 try Y1=2 S2=ok catch _ then S2=error end
      end
      thread
	 try X1=Y1 S3=ok catch _ then S3=error end
      end
      if S1==error orelse S2==error orelse S3==error then
	 X=1 % Default for X
	 Y=1 % Default for Y
      else X=X1 Y=Y1 end
   end
end

local X1 X2 Y1 Y2 in
   thread {Browse X1} end
   thread {Browse Y1} end
   thread X1=all|roads|X2 end
   thread Y1=all|roams|Y2 end
   thread X2=lead|to|rome|_ end
   thread Y2=lead|to|rhodes|_ end
end

local X0 X1 X2 X3 in
   thread
      Y0 Y1 Y2 Y3
   in
      {Browse [Y0 Y1 Y2 Y3]}
      Y0 = X0 + 1
      Y1 = X1 + Y0
      Y2 = X2 + Y1
      Y3 = X3 + Y2
      {Browse completed}
   end
end

local Fib FibT in
   fun {Fib X}
      if X=<2 then 1
      else {Fib X-1} + {Fib X-2} end
   end
   
   fun {FibT X}
      if X=<2 then 1
      else thread {Fib X-1} end + {Fib X-2} end
   end
   
   {Browse {FibT 40}}
   {Browse {Fib 40}}
end

local Filter in
   fun {Filter In F}
      case In
      of X|In2 then
	 if {F X} then X|{Filter In2 F}
	 else {Filter In2 F} end
      else
	 nil
      end
   end
   
   {Show {Filter [5 1 2 4 0] fun {$ X} X>2 end}}
   {Show 1}

   
end


declare Reverse1 Reverse2 Xs Ys in
fun lazy {Reverse1 S}
   fun {Rev S R}
      case S of nil then R
      [] X|S2 then {Rev S2 X|R} end
   end
in {Rev S nil} end
fun lazy {Reverse2 S}
   fun lazy {Rev S R}
      case S of nil then R
      [] X|S2 then {Rev S2 X|R} end
   end
in {Rev S nil} end

Xs = {Reverse1 [1 2 3]}
Ys = {Reverse2 [1 2 3]}
{Browse Xs}
{Browse Ys}