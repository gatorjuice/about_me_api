# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { "The 'Burbs (1989)" }

    summary do
      'An overstressed suburbanite and his neighbors are convinced that the new family on the block are part of a'
    end

    performance do
      [
        {
          region: 'Domestic (74.5%)',
          money: '$36,601,993'
        },
        {
          region: 'International (25.5%)',
          money: '$12,500,000'
        },
        {
          region: 'Worldwide',
          money: '$49,101,993'
        }
      ]
    end

    crew do
      {
        'Director' => 'Joe Dante',
        'Writer' => 'Dana Olsen',
        'Producer' => 'Michael Finnell',
        'Composer' => 'Jerry Goldsmith',
        'Cinematographer' => 'Robert M. Stevens',
        'Editor' => 'Marshall Harvey',
        'Production Designer' => 'James H. Spencer'
      }
    end

    cast do
      {
        'Ray Peterson' => 'Tom Hanks',
        'Mark Rumsfield' => 'Bruce Dern',
        'Carol Peterson' => 'Carrie Fisher',
        'Ricky Butler' => 'Corey Feldman'
      }
    end

    misc do
      {
        'Domestic Distributor' => 'Universal PicturesSee full company information',
        'Domestic Opening' => '$11,101,197',
        'Earliest Release Date' => 'February 17, 1989 (Domestic)',
        'Running Time' => '1 hr 42 min',
        'Genres' => 'Comedy Mystery Thriller',
        'IMDbPro' => 'See more details at IMDbPro'
      }
    end
    image do
      'https://m.media-amazon.com/images/M/MV5BNWE1OGExYzQtYzRjOS00MmJhLWE3OTYtZjkzOTNlMjJlZTQ4L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyODY0NzcxNw@@._V1_SY139_CR0,0,92,139_.jpg'
    end
  end
end
