functor
import Browser
define 
    N = 1000
    K = 3
    
    fun {NewActive Class Init}
        Obj={New Class Init}
        P
        in
            thread S in
            {NewPort S P}
            for M in S do {Obj M} end
        end
        proc {$ M} {Send P M} end
    end
    
    class Victim
        attr ident step last succ pred alive:true
        meth init(I K L) ident:=I step:=K last:=L end
        meth setSucc(S) succ:=S end
        meth setPred(P) pred:=P end
        meth kill(X S)
            if @alive then
                if S==1 then @last=@ident
                elseif X mod @step==0 then
                    alive:=false
                    {@pred newsucc(@succ)} 
                    {@succ newpred(@pred)}
                    {@succ kill(X+1 S-1)}
                else
                    {@succ kill(X+1 S)}
            end
            else {@succ kill(X S)} end
        end
        meth newsucc(S)
            if @alive then succ:=S
            else {@pred newsucc(S)} end
        end
        meth newpred(P)
            if @alive then pred:=P
            else {@succ newpred(P)} end
        end
    end
    
    fun {Josephus N K}
        A={NewArray 1 N null}
        Last
    in
        for I in 1..N do
            A.I:={NewActive Victim init(I K Last)}
        end
        for I in 2..N do {A.I setPred(A.(I-1))} end
        {A.1 setPred(A.N)}
        for I in 1..(N-1) do {A.I setSucc(A.(I+1))} end
        {A.N setSucc(A.1)} {A.1 kill(1 N)}
        Last
    end
    Value = {Josephus N K}
    
    {Browser.browse 'Josephus 2: Active Object Version'}
    {Browser.browse 'Carregando resultado para N ='#N#' e K = '#K#' ...'}
    {Browser.browse Value}
 
end
