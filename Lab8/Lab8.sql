DROP TABLE IF EXISTS actorsInformation;
DROP TABLE IF EXISTS moviesInformation;
DROP TABLE IF EXISTS directorsInformation;
DROP TABLE IF EXISTS moviesPlayedIn;
DROP TABLE IF EXISTS moviesDirected;

--Actors
CREATE TABLE actorsInformation (
actorID			char (2) not null,
name			text not null,
address			char not null,
birthdate		date not null,
hairColor		text not null,
eyeColor		text not null,
heightInches		integer not null,
weightPounds		integer, --not all information can be accessed online
spouse			text, --actors do not need to be married
favColor		text, --not all information can be accessed online
SAGD			date,
primary key(actorID)
);

--Movies
CREATE TABLE moviesInformation(
movieID			char(2) not null,
releasedYear		int not null,
MPAA			text not null,
domesticBoxUSD		int not null,
foreignBoxUSD		int not null,
DVDorBluRayUSD		int, --movie was not made for DVD or Blu-Ray
primary key(movieID)
);

--Directors
CREATE TABLE directorsInformation(
directorID		char (2) not null,
name			text not null,
address			char not null,
spouse			text, --directors do not need to be married
schoolAttended		text, --directors might have not gone to school
DGA			date,
favLensMaker		text,
primary key(directorID)
);

--MoviesActorsWereIn
CREATE TABLE moviesPlayedIn(
movieID 		char (2) not null references moviesInformation(movieID),
actorID 		char (2) not null references actorsInformation(actorID),
bondAgent		boolean not null, --played in a James Bond movie already or not
primary key(movieID,actorID)
);


--MoviesDirectorsDirected
CREATE TABLE moviesDirected(
movieID			char (2) not null references moviesInformation(movieID),
directorID		char (2) not null references directorsInformation(directorID),
bondDirector		boolean not null, --directed a James Bond movie already or not
primary key(movieID,directorID)
);

INSERT INTO actorsInformation( actorID, name, address, birthdate, hairColor, heightInches, weightPounds, spouse, favColor, SAG )
VALUES('a01', 'Sean Connery' );
     ('a02', 'George Lazenby' );
     ('a03', 'Roger Moore'  );
     ('a04', 'Timothy Dalton' );
     ('a05', 'Pierce Brosnan' );
     ('a06', 'Daniel Craig'  );
     ('a07', 'Liam Neeson'  );
     ('a08', 'Henry Cavill' );
     ('a09', 'Gerard Butler' );
     ('a10', 'Christian Bale'  );
     ('a11', 'Hugh Jackman', );
INSERT INTO moviesInformation( movieID, name, releasedYear, MPAA, domesticBoxUSD, foreignBoxUSD, DVDorBluRayUSD)
VALUES('m01', 'Dr. No', 1962  );
     ('m02', 'From Russia with Love', 1963, );
     ('m03', 'Goldfinger', 1964, );
     ('m04', 'Thunderball', 1965 );
     ('m05', 'You only Live Twice', 1967, );
     ('m06', 'On Her Majesty's Secret Service', 1969 );
     ('m07', 'Diamonds Are Forever', 1971 );
     ('m08', 'Live and Let Die', 1973);
     ('m09', 'The Man with the Golden Gun', 1974 );
     ('m10', 'The Spy Who Loved Me', 1977 );
    ('m11', 'Moonraker', 1979);
	('m12', 'For Your Eyes Only', 1981 );
	('m13', 'Octopussy', 1983);
	('m14', 'A View to a Kill, 1985 );
	('m15', 'The living Daylights', 1987 );
	('m16', 'License to Kill', 1989 );
	('m17', 'Goldeneye', 1995 );
	('m18', 'Tomorrow Never Dies', 1997 );
	('m19', 'The World Is Not Enough', 1999 );
	('m20', 'Die Another Day', 2002 );
	('m21', 'Casino Royale',2006);
	('m22', 'Quantum of Solace', 2008 );
	('m23', 'Skyfall', 2012 );
	('m24', 'Spectre', 2015 );
	('m25', 'Batman vs. Superman', 2016 );
	('m26', 'Taken', 2007 );
	('m27', 'Olympus Has Fallen', 2013 );
	('m28', 'The Dark Knight Rises', 2012);
	('m29', 'Logan', 2017 );
INSERT INTO directorsInformation( directorID, name, address, spouse, schoolAttended, DGA, favLensMaker)
VALUES('d01', 'Terence Young');
     ('d02', 'Guy Hamilton' );
     ('d03', 'Lewis Gilbert' );
     ('d04', 'Peter Hunt' );
     ('d05', 'John Glen' );
     ('d06', 'Irvin Kershner' );
     ('d07', 'Martin Campbell' );
('d08', 'Roger Spottiswoode' );
('d09', 'Michael Apted' );
('d10', 'Lee Tamahori');
('d11', 'Marc Forster');
('d12', 'Sam Mendes' );
('d13', 'Pierre Morel' );
('d14', 'Zack Snyder' );
('d15', 'Antoine Fuqua' );
('d16', 'Christopher Nolan' );
('d17', 'James Mangold' );

INSERT INTO moviesPlayedIn( movieID, actorID, BondAgent)
VALUES('m01', 'a01', 'yes' );
     ('m02', 'a01', 'yes' );
     ('m03', 'a01', 'yes' );
     ('m04', 'a01', 'yes' );
     ('m05', 'a01', 'yes' );
     ('m06', 'a02', 'yes' );
     ('m07', 'a01', 'yes' );
     ('m08', 'a03', 'yes' );
     ('m09', 'a03', 'yes' );
     ('m10', 'a03', 'yes' );
	('m11', 'a03', 'yes' );
     ('m12', 'a03', 'yes' );
     ('m13', 'a03', 'yes' );
     ('m14', 'a04', 'yes' );
     ('m15', 'a04', 'yes' );
	('m16', 'a04', 'yes' );
     ('m17', 'a01', 'yes' );
     ('m18', 'a05', 'yes' );
     ('m19', 'a05', 'yes' );
     ('m20', 'a05', 'yes' );
	('m21', 'a06', 'yes' );
     ('m22', 'a06', 'yes' );
     ('m23', 'a06', 'yes' );
     ('m24', 'a06', 'yes' );
     ('m25', 'a08', 'no' );
	('m26', 'a07', 'no' );
     ('m27', 'a09', 'no' );
     ('m28', 'a10', 'no' );
     ('m29', 'a11', 'no' );
INSERT INTO moviesDirected(movieID, directorID, BondDirector)
VALUES('m01', 'd01', 'yes' );
     ('m02', 'd01', 'yes' );
     ('m03', 'd02', 'yes' );
     ('m04', 'd01', 'yes' );
     ('m05', 'd03', 'yes' );
     ('m06', 'd04', 'yes' );
     ('m07', 'd02', 'yes' );
     ('m08', 'd02', 'yes' );
     ('m09', 'd02', 'yes' );
     ('m10', 'd03', 'yes' );
	('m11', 'd03', 'yes' );
     ('m12', 'd05', 'yes' );
     ('m13', 'd05', 'yes' );
     ('m14', 'd05', 'yes' );
     ('m15', 'd05', 'yes' );
	('m16', 'd05', 'yes' );
     ('m17', 'd07', 'yes' );
     ('m18', 'd08', 'yes' );
     ('m19', 'd09', 'yes' );
     ('m20', 'd10', 'yes' );
	('m21', 'd07', 'yes' );
     ('m22', 'd11', 'yes' );
     ('m23', 'd12', 'yes' );
     ('m24', 'd12', 'yes' );
     ('m25', 'd14', 'no' );
	('m26', 'd13', 'no' );
     ('m27', 'd15', 'no' );
     ('m28', 'd16', 'no' );
     ('m29', 'd17', 'no' );

     
SELECT *
FROM moviesDirected
WHERE movieID in (SELECT movieID
		  FROM moviesPlayedIn
		  WEHRE actorID = 01);