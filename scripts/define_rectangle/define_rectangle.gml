///define_rectangle()

hrad = (bbox_right-bbox_left)/2;
vrad = (bbox_bottom-bbox_top)/2;

in_theta = arctan2(vrad, hrad);

vrad /= image_yscale;
hrad /= image_xscale;

cshape = shape.rectangle;