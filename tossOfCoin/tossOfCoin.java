import java.util.Random;

public class tossOfCoin {
	public static void main(String[] args) {
		Random generator = new Random();
		int countHeads = 0;
		int countTails = 0;
		for (int count=0;(count<10000);count++)
		{
			int side=generator.nextInt(2);
			if (side ==1)
				countHeads++;
			else countTails++;
			boolean side1=(count == 9999) && (side==1);
			boolean side2=(count == 9999) && (side==0);
			if (side1)
				System.out.print("Heads: "+ countHeads+"\n"+
						"Tails: "+countTails+"\n"+
						"Last: Heads");
			else if (side2)
				System.out.print("Heads: "+ countHeads+"\n"+
						"Tails: "+countTails+"\n"+
						"Last: Tails");
		}


	}

}



//import java.util.Random;
//
///*
// * Write a program to determine simulate the toss of a coin.  For 10,000 tosses
// * determine how many heads and how many tails are tossed.  Also indicate what the
// * last toss was (tails or heads).
// * 
// * To simulate a coin toss we just need to obtain a random number with is either 0
// * (tails) or 1 (heads).
// */
//public class TossCoin {
//
//	public static final int NUMBER_OF_THROWS = 10000;
//	public static final int HEADS = 1;
//	public static final int TAILS = 0;
//
//	public static void main(String[] args) {
//
//		boolean headsShownOnCoin = false;
//		int headsCount = 0;
//		Random  generator = new Random();
//		
//		for (int throwCount=0; throwCount < NUMBER_OF_THROWS; throwCount++)
//		{
//			headsShownOnCoin = (generator.nextInt(2) == HEADS);
//			headsCount += (headsShownOnCoin) ? 1 : 0;
//		}
//
//		System.out.println( "Heads: " + headsCount +
//				"\nTails: " + (NUMBER_OF_THROWS-headsCount) +
//				"\nLast: " + ((headsShownOnCoin) ? "Heads" : "Tails"));
//
//	}
//
//}