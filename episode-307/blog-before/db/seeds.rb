bruce = Author.create! name: "Bruce Wayne"
clark = Author.create! name: "Clark Kent"

batman = Article.create! name: "Batman", author: bruce, published_at: 2.weeks.ago, content: <<-ARTICLE
Batman is a fictional character created by the artist Bob Kane and writer Bill Finger. A comic book superhero, Batman first appeared in Detective Comics #27 (May 1939), and since then has appeared primarily in publications by DC Comics. Originally referred to as "The Bat-Man" and still referred to at times as "The Batman", he is additionally known as "The Caped Crusader", "The Dark Knight", and the "World's Greatest Detective," among other titles. (from Wikipedia)
ARTICLE

superman = Article.create! name: "Superman", author: clark, published_at: 3.weeks.ago, content: <<-ARTICLE
Superman is a fictional comic book superhero appearing in publications by DC Comics, widely considered to be an American cultural icon. Created by American writer Jerry Siegel and Canadian-born American artist Joe Shuster in 1932 while both were living in Cleveland, Ohio, and sold to Detective Comics, Inc. (later DC Comics) in 1938, the character first appeared in Action Comics #1 (June 1938) and subsequently appeared in various radio serials, television programs, films, newspaper strips, and video games. (from Wikipedia)
ARTICLE

krypton = Article.create! name: "Krypton", author: clark, published_at: 5.weeks.ago, content: <<-ARTICLE
Krypton is a fictional planet in the DC Comics universe, and the native world of the super-heroes Superman and, in some tellings, Supergirl and Krypto the Superdog. Krypton has been portrayed consistently as having been destroyed just after Superman's flight from the planet, with exact details of its destruction varying by time period, writers and franchise. Kryptonians were the dominant people of Krypton. (from Wikipedia)
ARTICLE

Comment.create! name: "Lois Lane", article: superman, content: <<-COMMENT
I want to meet Superman again, does anyone know where I can find him?
COMMENT

Comment.create! name: "The Joker", article: batman, content: <<-COMMENT
Haha, Batman, you will see your bat signal tonight!
COMMENT

Comment.create! name: "Robin", article: batman, content: <<-COMMENT
Enough with the games Joker.
COMMENT

Comment.create! name: "Riddler", article: batman, content: <<-CONTENT
Did someone say games?
CONTENT

Article.create! name: "Upcoming", author: clark, published_at: 2.weeks.from_now, content: <<-ARTICLE
This article is set to be published in the future.
ARTICLE
