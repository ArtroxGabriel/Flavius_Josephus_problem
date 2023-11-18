declare N K Value Pipe Josephus2 

N = 69
K = 3

fun {Pipe Xs L H F}
    if L=<H then {Pipe {F Xs L} L+1 H F} else Xs end
end
fun {Josephus2 N K}
    fun {Victim Xs I}
        case Xs of kill(X S)|Xr then
            if S==1 then Last=I nil
            elseif X mod K==0 then
                kill(X+1 S-1)|Xr
            else
                kill(X+1 S)|{Victim Xr I}
            end
        [] nil then nil end
    end
    Last Zs
in
    Zs={Pipe kill(1 N)|Zs 1 N
        fun {$ Is I} thread {Victim Is I} end end}
    Last
end
Value = {Josephus N K}

{Browse 'Josephus 1: Data-Driven Concurrent Version'}
{Browse 'Carregando resultado para N ='#N#' e K = '#K#' ...'}
{Delay 1500}
{Browse Value}