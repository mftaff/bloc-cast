module BlocCastHelper
    def in_production?(actively_producing)
        actively_producing ? "In Production" : "Not in Production" 
    end

    def get_genre_name_by_id(id)
        genres = {
            "28": "Action",
            "12": "Adventure",
            "14": "Fantasy",
            "36": "History",
            "27": "Horror",
            "10402": "Music",
            "10749": "Romance",
            "878": "Science Fiction",
            "10770": "TV Movie",
            "53": "Thriller",
            "10752": "War",
            "37": "Western",
            "10759": "Action & Adventure",
            "16": "Animation",
            "35": "Comedy",
            "80": "Crime",
            "99": "Documentary",
            "18": "Drama",
            "10751": "Family",
            "10762": "Kids",
            "9648": "Mystery",
            "10763": "News",
            "10764": "Reality",
            "10765": "Sci-Fi & Fantasy",
            "10766": "Soap",
            "10767": "Talk",
            "10768": "War & Politics"
        }
        genres[id.to_s.to_sym]
    end

    def build_genre_tag(id)
        genre = get_genre_name_by_id(id)
        genre ? "<a class='genre' id='#{id}' href='#{search_path(having_genre: id.to_s)}'>#{genre}</a>".html_safe : ""
    end
end
