batman = Article.create! name: "Batman", content: <<-ARTICLE
Batman is a fictional character created by the artist Bob Kane and writer Bill Finger. A comic book superhero, Batman first appeared in Detective Comics #27 (May 1939), and since then has appeared primarily in publications by DC Comics. Originally referred to as "The Bat-Man" and still referred to at times as "The Batman", he is additionally known as "The Caped Crusader", "The Dark Knight", and the "World's Greatest Detective," among other titles. (from Wikipedia)
ARTICLE

superman = Article.create! name: "Superman", content: <<-ARTICLE
Superman is a fictional comic book superhero appearing in publications by DC Comics, widely considered to be an American cultural icon. Created by American writer Jerry Siegel and Canadian-born American artist Joe Shuster in 1932 while both were living in Cleveland, Ohio, and sold to Detective Comics, Inc. (later DC Comics) in 1938, the character first appeared in Action Comics #1 (June 1938) and subsequently appeared in various radio serials, television programs, films, newspaper strips, and video games. (from Wikipedia)
ARTICLE

krypton = Article.create! name: "Krypton", content: <<-ARTICLE
Krypton is a fictional planet in the DC Comics universe, and the native world of the super-heroes Superman and, in some tellings, Supergirl and Krypto the Superdog. Krypton has been portrayed consistently as having been destroyed just after Superman's flight from the planet, with exact details of its destruction varying by time period, writers and franchise. Kryptonians were the dominant people of Krypton. (from Wikipedia)
ARTICLE

lex_luthor = Article.create! name: "Lex Luthor", content: <<-ARTICLE
Lex Luthor is a fictional character, a supervillain who appears in comic books published by DC Comics. He is the archenemy of Superman, and is also a major adversary of Batman and other superheroes in the DC Universe. Created by Jerry Siegel and Joe Shuster, he first appeared in Action Comics #23 (April 1940). Luthor is described as "a power-mad, evil scientist" of high intelligence and incredible technological prowess. (from Wikipedia)
ARTICLE

robin = Article.create! name: "Robin", content: <<-ARTICLE
Robin is the name of several fictional characters appearing in comic books published by DC Comics, originally created by Bob Kane, Bill Finger and Jerry Robinson, as a junior counterpart to DC Comics superhero Batman. The team of Batman and Robin is commonly referred to as the Dynamic Duo or the Caped Crusaders. (from Wikipedia)
ARTICLE

Event.create! name: "Capture the Joker", starts_at: 2.days.from_now, ends_at: 3.days.from_now, description: "The Joker is at it again. Find his secret lair and capture him to keep him from causing more trouble."

Event.create! name: "Save the World", starts_at: 2.weeks.from_now, ends_at: 3.weeks.from_now, description: "An astroid is expected to collide with Earth around this time. It's a bird, it's a plain, it's Superman!"

Photo.create! name: "The Dark Knight Rises", filename: "dark_knight_rises.jpg"
Photo.create! name: "Superman", filename: "superman.jpg"