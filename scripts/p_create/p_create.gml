///p_create(seed)

random_set_seed(argument0);

var p = ds_list_create();
for(c = 0; c < 256; c++) ds_list_add(p, c);
ds_list_shuffle(p);

for(c = 0; c < p[ds_list_size(p)]; c++) ds_list_insert(p, p[0], p[ds_list_size(p)]);

return p;