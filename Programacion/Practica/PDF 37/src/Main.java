public class Main {

    public static void main(String args[]) {

      // tasc13
       int incremento;
        incremento = 1;
        System.out.println(++incremento+" "+ incremento++ +" "+incremento);
           // tasc14
        int a=1, b=2, c=3, d=1;
        float r, s=(float) 3.0;
        r=a+b/c+d/a;
        s=r-s;
        r=(long) s;
        r=++r;
        System.out.println(r);

       // tasc 15
        boolean valor1=false, valor2=false;
        int x=6, y=3;
        valor1= (x<5) || (x>y);
        valor2= (x<5) || (y==x);
        System.out.println("valor1 ," +valor1);
        System.out.println("valor2 ," +valor2);

         //  tasc 16
        boolean valor1=false, valor2=false;
        int x=6, y=3;
        valor1= (x<5) && (x>y);
        valor2= (x>5) && (y==x);
        System.out.println("valor1 ," +valor1);
        System.out.println("valor2 ," +valor2);
//tasc17
        int x=2, y=5;
        x*=y+2;
        System.out.println("valorx ," + x);

//tasca 18
        char c;
        c='c';

        System.out.println("c = " + c);
        ++c;
        System.out.println("c = " + c);
        System.out.println("c = " + c++ + c--);
        System.out.println("c = " + c);
//tasca 19
        int y;
        int n=5;
        y=n++ + ++n;
        System.out.println(n+" " +y);
tasca20
        boolean m=false, n=false, p, q;
        p=(!m )&&( n);
        q=(!m )||( n);
        System .out . println ("p="+p+" q="+q);
   tasca21
        int valor1=5, valor2=5;
        boolean m=false, n=false, p, q;
        p=( valor1 >= valor2 );
        q=( valor1 < valor2 );
        System . out . println ("p="+p+" q="+q);

tasca 22
        char a='a';
        int x=5;
        a+=5;// se suma de letras 
        x/=3;
        System.out.println(a+ " " +x);
tasca 23
        int var1=1, var2=1;
        boolean r,s;
        r=(var1++ <2);
        s=(++var2 <2);
        System.out.println("r="+r+" var1="+var1);
        s=(++var2 <2);
        System.out.println("s="+s+" var2="+var2);
tasca24
        double saldo;
        saldo=(1/5)*10;

        System.out.println(saldo*5.0);

tasca25
        int op;
        int a2=2, a8=8, a4=4, a1=1;
        op= a2+a8/a4+a1;
        System.out.println("op = " + op);

   tasca26
        int a,b,c;
        a= 2; b= 4; c= 4;
        System.out.println(a*b/2*c);


    tasca 27
        int op = 3 + 11 / 5 * 2 + 3 % 2;
        System.out.println("op = " + op);
tasca 28
        double a=2, b=5;
        int c=2, d=1;
        int x= (int)(b/a)/c+d;
        System.out.println("x: " + x);
tasca29

        int num, divisor=0;
        num =100;
        System.out.println("num inicial =" +num);
        num=num/divisor;
        num=num/2;
        System.out.println("num/2= ");
        System.out.println(num);
tasca30

        int m=1, n=4, k=2, j=1;
        float x, valor=(float)1.1;
        x=m+n/k+j;
        valor=x+valor;
        x=(long) valor;
        x=x+valor;
        System.out.println(x);
tasca31
        int v1 =1, v2 =2, v3 =3, v4 =4;
        float v5 , v6 =( float )2.2;
        v5= v4+v3*v2-v1;
        v6=v5-v6;
        v5=(long)v6;
        System.out.println(v5 +" "+v6);

   tasca32

        int a, b, c;
        a=2; b=4; c=4;
        System.out.println(a*b/2*c);

 tasca 34

        char caracter;
        caracter='c';
        System.out.println("caracter: " + caracter);
        --caracter;
        System.out.println("caracter: "+caracter);
        System.out.println("caracter: "+ caracter-- + caracter + caracter++ + caracter);

    tasca 35
        int var=1;
        boolean r,s,t,v;
        r=(var>1) && (var++ <100);
        s=(100 < var) && (150 > var++);
        t=(100 == var) || (200 > var++);
        v=(100 == var) || (200 > var++);
        System.out.println(r +" " + s +" "+t + " " + v);
   tasca36
        double saldo;
        saldo=(2/3)*2;
        saldo++;
        System.out.println(saldo);
*
        int m=7, n=2;
        m/=n+2;
        System .out . println(m);

    }


}