CREATE OR REPLACE procedure Fibonacci_Series(n IN number, r OUT number)is
fs1 number := 0;
fs2 number := 1;
fs3 number;
cnt number default 0;
t number;
begin
while cnt!= n-2
loop
fs3:=fs1+fs2;
r:=fs3;
t:=fs2;
fs2:=fs3;
fs1:=t;
cnt:=cnt+1;
end loop;
exception
when others then
dbms_output.put_line(sqlerrm);
end;

/* APPEL 
var v NUMBER;
execute Fibonacci_Series(20, :v);
PRINT v;
*/
