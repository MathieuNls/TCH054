create or replace function Fib_plus_n(n number, indice number)
return NUMBER AS
res number;
begin
 Fibonacci_Series(indice, res);
 res := res + n;
return res;
end;

/* APPEL

select Fib_plus_n(10, 20) from dual;

*/
