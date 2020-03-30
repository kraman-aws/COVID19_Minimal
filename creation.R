a %>% mutate(OFIPS = substr(OFIPS,1,nchar(OFIPS)-6),DFIPS = substr(DFIPS,1,nchar(DFIPS)-6)) %>% group_by(OFIPS,DFIPS) %>% summarize(FLOW=sum(FLOW)) %>% pivot_wider(OFIPS,values_from=FLOW,names_from=DFIPS,values_fill=c("FLOW"=0)) %>% .[,-1] %>% write.table(row.names=FALSE,col.names=FALSE,file="~/mobility.txt")
b %>% mutate(GEOID=substr(GEOID,1,nchar(GEOID)-6)) %>% rename(geoid=GEOID,pop2010 = POP10) %>% group_by(geoid) %>% summarize(pop2010 = sum(pop2010)) %>% write.csv("~/geodata.csv")

