# My Natural Wine Cellar

#### A mangement app for a wine cellar/portfolio for personal or business including trending data on your collection. (Upcoming: sophisticated derivitive-based market correlation tracking for your wines against the broader trend market).

#### Images
<img src="./public/assets/appDemoCellarView.png" alt="my cellars demo image" width="500"/>
<img src="./public/assets/appDemoTrendData.png" alt="my cellars trend data demo image" width="500"/>



#### A User Story

1. A user arrives at the sites home screen with some relevant natural wine resources and news.
2. The user will have the option to register on the navigation bar
3. Once logged in in the user will be able to view their existing cellars or create a new cellar.
4. Once inside their cellar the user will see their wines that have been added previously, with the ability to delete or edit a wine and also have the option to add another wine to the cellar.
5. When adding wines to the cellar the User will be able to specify the wine's name, winemaker, region, varietal(s), vintage, an image, any links and tasting notes.
6. When selecting a wine from the cellar the User will be taken to a display page for the wine which will include the relevant info as well as links to current trending data on popularity of the wine from google-trends to help the User evaluate their wine collection to what the rest of the world is doing.

#### Upcoming Features

* User custommization of trend parameters
* More inventory functionality for businesses to leverage stock management
* relational analysis between a wine/winemaker and natural wine popularity as a whole using comparative derivatives based algorithms. (Similar in function to a stocks correllation to a benchmark index. Example calculable metrics alpha, beta and sharp/sortino ratios to gain insight into the relative strength of a particular brand).

#### DB Tbls
users
	un
	pw
	admin

cellar
	name
	user_id (belongs to)

wines
	*
	*
	*

cellar_wines -- through table
	wine_id
	cellar_id



user has many cellars
cellar belongs to user

cellar has many wines through cellar_wines
wine has many cellars through cellar_wines

#### Developed by peter mccall murray

