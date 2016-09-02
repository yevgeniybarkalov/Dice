/*
	#####
	#000#
	#000#
	#000#
	#####
*/

import java.util.*;
Die[][] dice = new Die[3][3];
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
			dice[i][j] = new Die(100+(i*100),100+(j*100));

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
			dice[i][j].show();
		}
	}
}
void mousePressed()
{
	boolean in = false;
	int a = 0,b = 0;
	for (int i = 0; i < 3; i++)
		for (int j = 0; j < 3; j++)
			if (dice[i][j].contain(mouseX,mouseY))
			{
				a = i;
				b = j;
				in = true;
			}
	if (in)
		dice[a][b].roll();
	redraw();
}
class Die //models one single dice cube
{
	final int SIZE = 75;
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
		Face newFace = Face.ONE;
		do
		{
			int random = (int)(Math.random()*6);
			switch (random)
			{
				case 0:
				{
					newFace = Face.ONE;
					break;
				}
				case 1:
				{
					newFace = Face.TWO;
					break;
				}
				case 2:
				{
					newFace = Face.THREE;
					break;
				}
				case 3:
				{
					newFace = Face.FOUR;
					break;
				}
				case 4:
				{
					newFace = Face.FIVE;
					break;
				}
				case 5:
				{
					newFace = Face.SIX;
					break;
				}
			}
		}
		while (newFace.equals(face));
		face = newFace;
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

	boolean contain (int a, int b)
	{
		boolean x = false, y = false;
		if (a >= X && a <= X+50)
			x = true;
		if (b >= Y && b <= Y+50)
			y = true;
		return (x&&y);
	}
}