package AmonSample::DB;
use strict;
use warnings;
use utf8;
use parent qw(Teng);

__PACKAGE__->load_plugin('Count');
__PACKAGE__->load_plugin('Replace');
__PACKAGE__->load_plugin('Pager');

sub latest_text {
    my ($self) = @_;
	my ($row) = $self->search(
        'memos',
        {},
        { order_by => {'id' => 'DESC'}, limit => 1 }
    );
    return $row->get_column('text') if ($row);
}

sub insert_memo {
    my ( $self, $text ) = @_;
    $self->insert( 'memos', { text => $text } );
}

1;
