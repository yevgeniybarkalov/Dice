/*
	#####
	#000#
	#000#
	#000#
	#####
*/

import java.util.*;
Die[] dice = new Die[9];
public enum Face
{
	ONE,TWO,THREE,FOUR,FIVE,SIX
}

void setup()
{
	size (500,500);
	background(0, 255, 0);
	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			dice[i+j] = new Die(100+(i*100),100+(j*100));
			System.out.println(i);
		}
	}
	noLoop();
}
void draw()
{
	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			dice[i+j].show();
		}
	}
}
void mousePressed()
{
	System.out.println("'Ello, wassup?");
	redraw();
}
class Die //models one single dice cube
{
	final int SIZE = 100;
	int X,Y;
	Face face;
	Die(int X, int Y) //constructor
	{
		this.X = X;
		this.Y = Y;
		face = Face.ONE;
	}
	void roll()
	{
		int random = (int)(Math.random()*6);
		switch (random)
		{
			case 0:
			{
				face = Face.ONE;
				break;
			}
			case 1:
			{
				face = Face.TWO;
				break;
			}
			case 2:
			{
				face = Face.THREE;
				break;
			}
			case 3:
			{
				face = Face.FOUR;
				break;
			}
			case 4:
			{
				face = Face.FIVE;
				break;
			}
			case 5:
			{
				face = Face.SIX;
				break;
			}
		}
	}
	void show()
	{
		fill (255,255,255);
		rect(X, Y, SIZE, SIZE);
		fill (0,0,0);
		switch (face)
		{
			case ONE:
			{
				ellipse(X+SIZE/2, Y+SIZE/2, 20, 20);
				break;
			}
			case TWO:
			{
				ellipse(X+(SIZE*3/4), Y+SIZE/4, 20, 20);
				ellipse(X+SIZE/4, Y+(SIZE*3/4), 20, 20);
				break;
			}
			case THREE:
			{
				ellipse(X+(SIZE*3/4), Y+SIZE/4, 20, 20);
				ellipse(X+SIZE/2, Y+SIZE/2, 20, 20);
				ellipse(X+SIZE/4, Y+(SIZE*3/4), 20, 20);
				break;
			}
			case FOUR:
			{
				ellipse(X+SIZE/4, Y+SIZE/4, 20, 20);
				ellipse(X+(SIZE*3/4), Y+SIZE/4, 20, 20);
				ellipse(X+SIZE/4, Y+(SIZE*3/4), 20, 20);
				ellipse(X+(SIZE*3/4), Y+(SIZE*3/4), 20, 20);
				break;
			}
			case FIVE:
			{
				ellipse(X+SIZE/4, Y+SIZE/4, 20, 20);
				ellipse(X+(SIZE*3/4), Y+SIZE/4, 20, 20);
				ellipse(X+SIZE/4, Y+(SIZE*3/4), 20, 20);
				ellipse(X+(SIZE*3/4), Y+(SIZE*3/4), 20, 20);
				ellipse(X+SIZE/2, Y+SIZE/2, 10, 10);
				break;
			}
			case SIX:
			{
				ellipse(X+SIZE/4, Y+SIZE/4, 20, 20);
				ellipse(X+(SIZE*3/4), Y+SIZE/4, 20, 20);
				ellipse(X+SIZE/2, Y+SIZE/4, 20, 20);
				ellipse(X+SIZE/4, Y+(SIZE*3/4), 20, 20);
				ellipse(X+(SIZE*3/4), Y+(SIZE*3/4), 20, 20);
				ellipse(X+SIZE/2,Y+(SIZE*3/4),20,20);
				break;
			}
		}
	}
}