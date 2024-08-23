--TEST--
Test win32_start_service_ctrl_dispatcher function argscal
--SKIPIF--
<?php
if (substr(PHP_OS, 0, 3) != 'WIN') die('skip only windows test.');
?>
--FILE--
<?php
function displayException(Throwable $e){
    printf("%s: (%d) %s\n", get_class($e), $e->getCode(), $e->getMessage());
}

try {
    win32_start_service_ctrl_dispatcher('service');
} catch (Throwable $e) {
    displayException($e);
}

?>
--EXPECT--
Win32ServiceException: (0) This function work only when using the CLI SAPI and called into the service code.
