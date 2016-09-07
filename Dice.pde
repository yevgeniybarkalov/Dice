import java.util.*;
Die[][] dice = new Die[3][3];
PFont thisFont;

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
	thisFont = createFont("Arial",16,true);
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
  	int totalValue = 0;
  	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			totalValue += dice[i][j].value();
		}
	}
	textFont(thisFont,16);
  	fill(0);
  	textAlign(CENTER);
  	textSize(50);
  	text("The total be " + totalValue,250,50);
}
void mousePressed()
{
	boolean inDie = false;
	int a = 0,b = 0;
	for (int i = 0; i < 3; i++)
		for (int j = 0; j < 3; j++)
			if (dice[i][j].containMe(mouseX,mouseY))
			{
				a = i;
				b = j;
				inDie = true;
			}
	if (inDie)
		dice[a][b].roll();
	redraw();
}
class Die //models one single dice cube
{
	final int dieSIZE = 75;
	int myX,myY;
	int face;
	Die(int a, int b) //constructor
	{
		myX = a;
		myY = b;
		face = 1;
		roll();
	}
	void roll()
	{
		int newFace = 1;
		do
		{
			int randoM = (int)(Math.random()*6);
			switch (randoM)
			{
				case 0:
				{
					newFace = 1;
					break;
				}
				case 1:
				{
					newFace = 2;
					break;
				}
				case 2:
				{
					newFace = 3;
					break;
				}
				case 3:
				{
					newFace = 4;
					break;
				}
				case 4:
				{
					newFace = 5;
					break;
				}
				case 5:
				{
					newFace = 6;
					break;
				}
			}
		}
		while (newFace == face);
		face = newFace;
	}
	void showDie()
	{
		fill (255,255,255);
		rect(myX, myY, dieSIZE, dieSIZE);
		fill (0,0,0);
		if (face == 1)
			ellipse(myX+dieSIZE/2, myY+dieSIZE/2, 20, 20);
		else if (face == 2)
		{
			ellipse(myX+(dieSIZE*3/4), myY+dieSIZE/4, 20, 20);
			ellipse(myX+dieSIZE/4, myY+(dieSIZE*3/4), 20, 20);
		}
		else if (face == 3)
		{
			ellipse(myX+(dieSIZE*3/4), myY+dieSIZE/4, 20, 20);
			ellipse(myX+dieSIZE/2, myY+dieSIZE/2, 20, 20);
			ellipse(myX+dieSIZE/4, myY+(dieSIZE*3/4), 20, 20);
		}
		else if (face == 4)
		{
			ellipse(myX+dieSIZE/4, myY+dieSIZE/4, 20, 20);
			ellipse(myX+(dieSIZE*3/4), myY+dieSIZE/4, 20, 20);
			ellipse(myX+dieSIZE/4, myY+(dieSIZE*3/4), 20, 20);
			ellipse(myX+(dieSIZE*3/4), myY+(dieSIZE*3/4), 20, 20);
		}
		else if (face == 5)
		{
			ellipse(myX+dieSIZE/4, myY+dieSIZE/4, 20, 20);
			ellipse(myX+(dieSIZE*3/4), myY+dieSIZE/4, 20, 20);
			ellipse(myX+dieSIZE/4, myY+(dieSIZE*3/4), 20, 20);
			ellipse(myX+(dieSIZE*3/4), myY+(dieSIZE*3/4), 20, 20);
			ellipse(myX+dieSIZE/2, myY+dieSIZE/2, 10, 10);
		}
		else if (face == 6)
		{
			ellipse(myX+dieSIZE/4, myY+dieSIZE/4, 20, 20);
			ellipse(myX+(dieSIZE*3/4), myY+dieSIZE/4, 20, 20);
			ellipse(myX+dieSIZE/2, myY+dieSIZE/4, 20, 20);
			ellipse(myX+dieSIZE/4, myY+(dieSIZE*3/4), 20, 20);
			ellipse(myX+(dieSIZE*3/4), myY+(dieSIZE*3/4), 20, 20);
			ellipse(myX+dieSIZE/2, myY+(dieSIZE*3/4),20,20);
		}
	}

	boolean containMe (int a, int b)
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
		if (face == 1)
			return 1;
		else if (face == 2)
			return 2;
		else if (face == 3)
			return 3;
		else if (face == 4)
			return 4;
		else if (face == 5)
			return 5;
		else if (face == 6)
			return 6;
		else
			return 0;
	}
}