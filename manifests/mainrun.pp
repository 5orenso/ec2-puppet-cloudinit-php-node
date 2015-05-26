node default {
    include base::core
    include base::node
    include base::apache2
    include base::php
    include base::varnish
    include nodeapp::prework
    include nodeapp::core
}
