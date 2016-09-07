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
			dice[i][j].showDie();
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
	final int dieSIZE = 75;
	int myX,myY;
	Face face;
	Die(int a, int b) //constructor
	{
		myX = a;
		myY = b;
		face = Face.ONEf;
		roll();
	}
	void roll()
	{
		Face newFace = Face.ONEf;
		do
		{
			int randoM = (int)(Math.random()*6);
			switch (randoM)
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
	void showDie()
	{
		fill (255,255,255);
		rect(myX, myY, dieSIZE, dieSIZE);
		fill (0,0,0);
		if (face == Face.ONEf)
			ellipse(myX+dieSIZE/2, myY+dieSIZE/2, 20, 20);
		else if (face == Face.TWOf)
		{
			ellipse(myX+(dieSIZE*3/4), myY+dieSIZE/4, 20, 20);
			ellipse(myX+dieSIZE/4, myY+(dieSIZE*3/4), 20, 20);
		}
		else if (face == Face.THREEf)
		{
			ellipse(myX+(dieSIZE*3/4), myY+dieSIZE/4, 20, 20);
			ellipse(myX+dieSIZE/2, myY+dieSIZE/2, 20, 20);
			ellipse(myX+dieSIZE/4, myY+(dieSIZE*3/4), 20, 20);
		}
		else if (face == Face.FOURf)
		{
			ellipse(myX+dieSIZE/4, myY+dieSIZE/4, 20, 20);
			ellipse(myX+(dieSIZE*3/4), myY+dieSIZE/4, 20, 20);
			ellipse(myX+dieSIZE/4, myY+(dieSIZE*3/4), 20, 20);
			ellipse(myX+(dieSIZE*3/4), myY+(dieSIZE*3/4), 20, 20);
		}
		else if (face == Face.FIVEf)
		{
			ellipse(myX+dieSIZE/4, myY+dieSIZE/4, 20, 20);
			ellipse(myX+(dieSIZE*3/4), myY+dieSIZE/4, 20, 20);
			ellipse(myX+dieSIZE/4, myY+(dieSIZE*3/4), 20, 20);
			ellipse(myX+(dieSIZE*3/4), myY+(dieSIZE*3/4), 20, 20);
			ellipse(myX+dieSIZE/2, myY+dieSIZE/2, 10, 10);
		}
		else if (face == Face.SIXf)
		{
			ellipse(myX+dieSIZE/4, myY+dieSIZE/4, 20, 20);
			ellipse(myX+(dieSIZE*3/4), myY+dieSIZE/4, 20, 20);
			ellipse(myX+dieSIZE/2, myY+dieSIZE/4, 20, 20);
			ellipse(myX+dieSIZE/4, myY+(dieSIZE*3/4), 20, 20);
			ellipse(myX+(dieSIZE*3/4), myY+(dieSIZE*3/4), 20, 20);
			ellipse(myX+dieSIZE/2, myY+(dieSIZE*3/4),20,20);
		}
	}

	boolean contain (int a, int b)
	{
		boolean inX = false, inY = false;
		if (a >= myX && a <= myX+dieSIZE)
			inX = true;
		if (b >= myY && b <= myY+dieSIZE)
			inY = true;
		return (inX&&inY);
	}

	int value ()
	{
		if (face == Face.ONEf)
			return 1;
		else if (face == Face.TWOf)
			return 2;
		else if (face == Face.THREEf)
			return 3;
		else if (face == Face.FOURf)
			return 4;
		else if (face == Face.FIVEf)
			return 5;
		else if (face == Face.SIXf)
			return 6;
		else
			return 0;
	}
}