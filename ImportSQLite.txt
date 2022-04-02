
Pkg.add("MySQL")


# Download Package SQLite using Pkg, also updating.
using Pkg
Pkg.add("SQLite")
Pkg.update("SQLite")

# Initialize SQLite and check
using SQLite

# Import SQLLite database
dbpath = raw"C:\Users\ivylm\Documents\NFT\nfts.sqlite"     #@raw_str macro required because of how Julia parses backslashes
NFTDB = SQLite.DB(dbpath)
# Cannot get the above to work, must troubleshoot that later
NFTDB = SQLite.DB(raw"C:\Users\ivylm\Documents\NFT\nfts.sqlite")

SQLite.tables(NFTDB)
