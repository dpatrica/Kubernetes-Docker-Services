<?php
declare(strict_types = 1);

$cfg['blowfish_secret'] = 'Uf8F(*&3hfOfhoOEFO4O399OkKl';
$cfg['TempDir'] = '/tmp';

$i = 0;

$i++;

$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
