/*
	#####
	#000#
	#000#
	#000#
	#####
*/

import java.util.*;
Die[][] dice = new Die[3][3];
PFont f;
public enum Face
{
	ONEf,TWOf,THREEf,FOURf,FIVEf,SIXf
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
	f = createFont("Arial",50,true);
	noLoop();
}
void draw()
{
	background(0,255,0);
	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			dice[i][j].show();
		}
	}
	textFont(f,16);
  	fill(0);
  	int sum = 0;
  	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			sum += dice[i][j].value();
		}
	}
  	textAlign(CENTER);
  	textSize(50);
  	text("The total be " + sum,250,50);
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
		face = Face.ONEf;
		roll();
	}
	void roll()
	{
		Face newFace = Face.ONEf;
		do
		{
			int random = (int)(Math.random()*6);
			switch (random)
			{
				case 0:
				{
					newFace = Face.ONEf;
					break;
				}
				case 1:
				{
					newFace = Face.TWOf;
					break;
				}
				case 2:
				{
					newFace = Face.THREEf;
					break;
				}
				case 3:
				{
					newFace = Face.FOURf;
					break;
				}
				case 4:
				{
					newFace = Face.FIVEf;
					break;
				}
				case 5:
				{
					newFace = Face.SIXf;
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
			case ONEf:
			{
				ellipse(X+SIZE/2, Y+SIZE/2, 20, 20);
				break;
			}
			case TWOf:
			{
				ellipse(X+(SIZE*3/4), Y+SIZE/4, 20, 20);
				ellipse(X+SIZE/4, Y+(SIZE*3/4), 20, 20);
				break;
			}
			case THREEf:
			{
				ellipse(X+(SIZE*3/4), Y+SIZE/4, 20, 20);
				ellipse(X+SIZE/2, Y+SIZE/2, 20, 20);
				ellipse(X+SIZE/4, Y+(SIZE*3/4), 20, 20);
				break;
			}
			case FOURf:
			{
				ellipse(X+SIZE/4, Y+SIZE/4, 20, 20);
				ellipse(X+(SIZE*3/4), Y+SIZE/4, 20, 20);
				ellipse(X+SIZE/4, Y+(SIZE*3/4), 20, 20);
				ellipse(X+(SIZE*3/4), Y+(SIZE*3/4), 20, 20);
				break;
			}
			case FIVEf:
			{
				ellipse(X+SIZE/4, Y+SIZE/4, 20, 20);
				ellipse(X+(SIZE*3/4), Y+SIZE/4, 20, 20);
				ellipse(X+SIZE/4, Y+(SIZE*3/4), 20, 20);
				ellipse(X+(SIZE*3/4), Y+(SIZE*3/4), 20, 20);
				ellipse(X+SIZE/2, Y+SIZE/2, 10, 10);
				break;
			}
			case SIXf:
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
		boolean inX = false, inY = false;
		if (a >= X && a <= X+SIZE)
			inX = true;
		if (b >= Y && b <= Y+SIZE)
			inY = true;
		return (inX&&inY);
	}

	int value ()
	{
		switch (face)
		{
			case ONEf:
			{
				return 1;
			}
			case TWOf:
			{
				return 2;
			}
			case THREEf:
			{
				return 3;
			}
			case FOURf:
			{
				return 4;
			}
			case FIVEf:
			{
				return 5;
			}
			case  SIXf:
			{
				return 6;
			}
			default:
			{
				return 0;
			}
		}
	}
}