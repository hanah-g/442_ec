public class Hello {
	
	static boolean isPrime(int n)
    {
        if (n <= 1)
        {
            return false;
        }
        for (int i = 2; i < n; i++)
        {
            if (n % i == 0)
            {
                return false;
            }
        }
        return true;
    }
	
	public static int gcd(int p, int q) {
		if(p%q == 0) 
		{
			return q;
		}
		else 
		{
			return gcd(q, p%q);
		}
	}
	
	public static long modExp(long base, long exp, long mod) {
	        long result = 1;
	        while (exp > 0) 
	        {
	            if ((exp & 1) == 1) //exp is odd
	            {
	                result = (result * base) % mod;
	            }
	            exp = exp/2;
	            base = (base * base) % mod;
	        }
	        return result;
	 }

	public static void main(String[] args) {
		//get p and q
		int p = (int) ((Math.random()*1000)+1);
		while (!isPrime(p)) {
			p = (int) ((Math.random()*1000)+1);
		}
		int q = (int) ((Math.random()*1000)+1);
		while (!isPrime(q) || p==q) {
			q = (int) ((Math.random()*1000)+1);
		}
		//get M and N
		int N = p * q;
		int M = (p-1)*(q-1); 
		//get x and e
		int e = (int) ((Math.random()*(M-3))+3); //3 <= e <= M
		while (gcd(M,e) != 1) {
			e = (int) ((Math.random()*(M-3))+3);
		}
		int x = (int) ((Math.random()*(N-2))+2);
		while (gcd(N,x) != 1) {
			x = (int) ((Math.random()*(N-2))+2);
		}
		//compute the bits
		long [] xArray = new long [100];
		long [] yArray = new long [100];
		yArray[0] = (x); //y1 = x
		xArray[0] = (yArray[0] % 2); //x1 = y1 mod 2
		for (int i = 1; i < 100; i++)
		{			
			long yi = yArray[i-1];
			long yiPlusOne = modExp(yi,e,N); //y+1 = y^e mod N
			yArray[i] = yiPlusOne;
			xArray[i] = yiPlusOne % 2;
		}
		//printing
		System.out.println("p is: " + p);
		System.out.println("q is: " + q);
		System.out.println("e is: " + e);
		System.out.println("The 100 bits with each 10 marked: ");
		for (int i = 0; i < 100; i++)
		{
			long xi = xArray[i];
			System.out.print(xi);
		}
		System.out.println();
		for (int i = 0; i <= 100; i++)
		{
			if ((i+1)% 10 == 0)
			{
				System.out.print((i+1)/10);
			}
			else
			{
				System.out.print(" ");
			}
		}
				
	}
}
