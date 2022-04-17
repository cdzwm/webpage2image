#!/usr/bin/env perl
use Mojolicious::Lite;
use MIME::Base64;


get '/' => sub {
  my $c = shift;
  $c->render(template => 'index');
};

post '/save_image' => sub {
	my $c = shift;
	my $data = $c->req->body;
	my $img = decode_base64(substr($data, 22));
	open my $fh, ">pic.png";
	binmode($fh);
	say $fh $img;
	close($fh);
};
app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>Welcome to the Mojolicious real-time web framework!</h1>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
