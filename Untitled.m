clear all
% refprop物性参数调用示例
fluid1='methane';
fluid2='ethane';
fluid3='nitrogen';
%这里为了方便将所有物质替换成fluid1,fluid2,fluid3的字符串
x0=[0.8 0.1 0.1];
p0=refpropm('P','T',200,'Q',0,fluid1,fluid2,fluid3,x0);


f=@(t,x)[-0.2*x(1)+x(2)*x(3)+0.3*x(1)*x(2);
    2*x(1)*x(2)-5*x(2)*x(3)-2*x(2)*x(2)*(refpropm('P','T',200,'Q',x(1),fluid1,fluid2,fluid3,x0));
    x(1)+x(2)+x(3)-1];
M=[1,0,0;0,1,0;0,0,0];
options=odeset;options.Mass=M;
x0=[0.8;0.1;0.1];
[t,x]=ode15s(f,[0,20],x0,options);
plot(t,x)
