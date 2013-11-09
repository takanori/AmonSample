package AmonSample::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;

get '/memo' => sub {
    my ($c) = @_;
    my $latest_text = $c->db->latest_text;
    $latest_text //= "No comment";
    return $c->render( 'memo.tx', { latest_text => $latest_text } );
};

post 'memo/insert' => sub {
    my ($c) = @_;
    my $text = $c->req->param('text');
    $c->db->insert_memo($text);
    return $c->redirect('/memo');
};

1;
