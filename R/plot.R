#' Plot kitten growth
#'
#' @param kittens A data.frame of the kitten growth.
#' @return A ggplot2 object
#' @export
#' @examples
#' plot_kitten_growth()
plot_kitten_growth <- function(kittens = purrfectdata::kitten_growth){
  ggplot2::ggplot(data = kittens,
                  ggplot2::aes_string(x = "datetime", y = "mass", group = "name", color = "name")) +
    ggplot2::geom_point(size = 1) +
    ggplot2::geom_line() +
    ggplot2::labs(x = "Date", y = "Mass") +
    ggplot2::scale_color_discrete(name = "Kitten")
}
