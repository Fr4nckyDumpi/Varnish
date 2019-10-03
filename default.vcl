vcl 4.0;

backend default {
    .host = "127.0.0.1";
    .port = "8080";
}

  #ETAPE 5
acl authorizedpurge {
    "8.8.4.4";
    "8.8.8.8";
    "localhost";
}

sub vcl_recv {

  #ETAPE 3
    if (req.url ~ "^/status\.php") {
        return (pass);}
    if (req.url ~ "^/update\.php") {
        return (pass);}
    if (req.url ~ "^/install\.php") {
        return (pass);}
    if (req.url ~ "^/apc\.php") {
        return (pass);}
    if (req.url ~ "^/admin") {
        return (pass);}
    if (req.url ~ "^/admin/.*$") {
        return (pass);}
    if (req.url ~ "^/user") {
        return (pass);}
    if (req.url ~ "^/user/.*$") {
        return (pass);}
    if (req.url ~ "^/users/.*$") {
        return (pass);}
    if (req.url ~ "^/info/.*$") {
        return (pass);}
    if (req.url ~ "^/flag/.*$") {
        return (pass);}
    if (req.url ~ "^.*$/ajax/.*$") {
        return (pass);}
    if (req.url ~ "^.*$/ahah/.*$") {
        return (pass);}
    if (req.url ~ "^/system/files/.*$") {
        return (pass);}

  #ETAPE 4
    if (req.url ~ ".(avi|doc|docx|eot|jpeg|jpg|png|gif|ico|swf|js|css|csv|gz|rar|txt|bzip|pdf|mov|mp3|mp4|mpeg|mpg)(\?.*|)$") {
       unset req.http.Cookie;}

  #ETAPE 6
    if (req.method == "PURGE") {
       if (client.ip ~ authorizedpurge) {
          return (purge);}}

  #ETAPE 7
    if (req.http.User-Agent ~ "Facebookexternalhit"){
        return(pass);}
    if (req.http.User-Agent ~ "Twitterbot"){
        return(pass);}
    if (req.http.User-Agent ~ "Google-Site-Verification"){
        return(pass);}
    if (req.http.User-Agent ~ "Google Page Speed Insights"){
        return(pass);}

}

sub vcl_backend_response {
  #ETAPE 4
    if (bereq.url ~ ".(avi|doc|docx|eot|jpeg|jpg|png|gif|ico|swf|js|css|csv|gz|rar|txt|bzip|pdf|mov|mp3|mp4|mpeg|mpg)(\?.*|)$") {
       unset beresp.http.Cookie;}

  #ETAPE 8
    if (bereq.url ~ "^/assets/.*$"){
       set beresp.ttl = 3d;}
}

sub vcl_deliver {

}