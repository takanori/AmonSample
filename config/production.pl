use File::Spec;
use File::Basename qw(dirname);
my $basedir = File::Spec->rel2abs(File::Spec->catdir(dirname(__FILE__), '..'));
my $dbpath = File::Spec->catfile($basedir, 'db', 'production.db');
# +{
#     'DBI' => [
#         "dbi:SQLite:dbname=$dbpath", '', '',
#         +{
#             sqlite_unicode => 1,
#         }
#     ],
# };
+{
    'DBI' => [
        'dbi:mysql:amonsample',
		'YourUserName',
		'YourPassword',
		+{ mysql_enable_utf8 => 1 },
    ],
};
