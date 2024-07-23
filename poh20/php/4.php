#!/usr/bin/env php
<?=max(array_map("intval",explode("\n",stream_get_contents(STDIN))));
