require 'rspec'
require 'movie_sql'

describe "#top_gun_cast" do
  it "1. List Top Gun cast by last name" do
    expect(top_gun_cast).to eq([
      {"name"=>"Adrian Pasdar"},
      {"name"=>"Anthony Edwards"},
      {"name"=>"Barry Tubb"},
      {"name"=>"Clarence Gilyard, Jr."},
      {"name"=>"David Patterson"},
      {"name"=>"Duke Stroud"},
      {"name"=>"James Tolkan"},
      {"name"=>"John Stockwell"},
      {"name"=>"Kelly McGillis"},
      {"name"=>"Linda Rae Jurgens"},
      {"name"=>"Meg Ryan"},
      {"name"=>"Michael Ironside"},
      {"name"=>"Rick Rossovich"},
      {"name"=>"Tim Robbins"},
      {"name"=>"Tom Cruise"},
      {"name"=>"Tom Skerritt"},
      {"name"=>"Val Kilmer"},
      {"name"=>"Whip Hubley"}
    ])
  end
end

describe "#harrison_ford_films" do
  it "2. List Harrison Ford films by movie title" do
    expect(harrison_ford_films).to eq([
      { "title" => "A Hundred and One Nights" },
      { "title" => "American Graffiti" },
      { "title" => "Apocalypse Now" },
      { "title" => "Dead Heat on a Merry-Go-Round" },
      { "title" => "Extraordinary Measures" },
      { "title" => "Firewall" },
      { "title" => "Force 10 From Navarone" },
      { "title" => "Hawthorne of the U.S.A." },
      { "title" => "Hollywood Homicide" },
      { "title" => "Indiana Jones and the Last Crusade" },
      { "title" => "Jimmy Hollywood" },
      { "title" => "More American Graffiti" },
      { "title" => "Morning Glory" },
      { "title" => "Presumed Innocent" },
      { "title" => "Regarding Henry" },
      { "title" => "Sabrina" },
      { "title" => "Sally of the Sawdust" },
      { "title" => "Shadows" },
      { "title" => "Six Days Seven Nights" },
      { "title" => "Smilin' Through" },
      { "title" => "Star Wars Episode IV: A New Hope" },
      { "title" => "Star Wars Episode V: The Empire Strikes Back" },
      { "title" => "Star Wars Episode VI: Return of the Jedi" },
      { "title" => "The Conversation" },
      { "title" => "The Devil's Own" },
      { "title" => "The Fugitive" },
      { "title" => "The Star Wars Holiday Special" },
      { "title" => "What Lies Beneath" },
      { "title" => "Witness" }
    ])
  end
end

describe "#christopher_walken_21st_century_films" do
  it "3. List Christopher Walken 21st century films by movie title" do
    expect(christopher_walken_21st_century_films).to eq([
      {"title"=>"Balls of Fury", "yr"=>2007},
      {"title"=>"Catch Me If You Can", "yr"=>2002},
      {"title"=>"Click", "yr"=>2006},
      {"title"=>"Envy", "yr"=>2004},
      {"title"=>"Gigli", "yr"=>2003},
      {"title"=>"Joe Dirt", "yr"=>2001},
      {"title"=>"Man On Fire", "yr"=>2004},
      {"title"=>"Man of the Year", "yr"=>2006},
      {"title"=>"The Country Bears", "yr"=>2002},
      {"title"=>"The Rundown", "yr"=>2003},
      {"title"=>"The Stepford Wives", "yr"=>2004},
      {"title"=>"Wedding Crashers", "yr"=>2005}
    ])
  end
end

describe "#leading_star_for_1910_films" do
  it "4. List 1910 leading stars by movie title" do
     expect(leading_star_for_1910_films).to eq([
       {"title"=>"A Christmas Carol", "name"=>"Marc McDermott"},
       {"title"=>"In the Border States", "name"=>"Charles West"},
       {"title"=>"The Blue Bird", "name"=>"Edward Rigby"},
       {"title"=>"The House with Closed Shutters", "name"=>"Henry B. Walthall"},
       {"title"=>"The Unchanging Sea", "name"=>"Arthur V. Johnson"}
     ])
   end
end

describe "#unknown_actors_2012" do
  it "5. Give the 2012 movie without casting info" do
    expect(unknown_actors_2012).to eq([
      {"id"=>20377, "title"=>"Titanic"}
    ])
  end
end

describe "#big_movie_stars" do
  it "6. List movies having > 60 roles" do
    expect(big_movies).to eq([
      {"title"=>"A Hundred and One Nights", "roles"=>70},
      {"title"=>"Perfect", "roles"=>78},
      {"title"=>"S.W.A.T.", "roles"=>68}
    ])
  end
end

describe "#will_smith_supporting_actors" do
  it "7. List the supporting actor for all Will Smith films" do
    expect(will_smith_supporting_actors).to eq([
      {"yr"=>2007, "title"=>"I Am Legend", "name"=>"Alice Braga"},
      {"yr"=>2004, "title"=>"i, Robot", "name"=>"Bridget Moynahan"},
      {"yr"=>2005, "title"=>"Hitch", "name"=>"Eva Mendes"},
      {"yr"=>1999, "title"=>"Enemy of the State", "name"=>"Gene Hackman"},
      {"yr"=>2004, "title"=>"Shark Tale", "name"=>"Jack Black"},
      {"yr"=>2006, "title"=>"The Pursuit of Happiness", "name"=>"Jaden Smith"},
      {"yr"=>2000, "title"=>"The Legend of Bagger Vance", "name"=>"Matt Damon"}
    ])
  end
end

describe "#barrie_ingham_multiple_roles" do
  it "8. List movies in which Barrie Ingham plays multiple roles" do
    expect(barrie_ingham_multiple_roles).to eq([
      {"title"=>"The Great Mouse Detective"}
    ])
  end
end

