require "pagy/extras/bootstrap"  # If you want Bootstrap UI
require "pagy/extras/overflow"

# Default options
Pagy::DEFAULT[:items] = 25
Pagy::DEFAULT[:overflow] = :last_page 