/* This is a generated file, edit the .stub.php file instead.
 * Stub hash: 8c06a87cf3792f3276e9fb63dbdd49aa7dd1c297 */

ZEND_BEGIN_ARG_INFO_EX(arginfo_class_Win32Service_RightInfo___construct, 0, 0, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(arginfo_class_Win32Service_RightInfo___clone, 0, 0, IS_VOID, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(arginfo_class_Win32Service_RightInfo___serialize, 0, 0, IS_ARRAY, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(arginfo_class_Win32Service_RightInfo___unserialize, 0, 1, IS_VOID, 0)
	ZEND_ARG_TYPE_INFO(0, data, IS_ARRAY, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(arginfo_class_Win32Service_RightInfo___toString, 0, 0, IS_STRING, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(arginfo_class_Win32Service_RightInfo_getUsername, 0, 0, IS_STRING, 1)
ZEND_END_ARG_INFO()

#define arginfo_class_Win32Service_RightInfo_getDomain arginfo_class_Win32Service_RightInfo_getUsername

#define arginfo_class_Win32Service_RightInfo_getFullUsername arginfo_class_Win32Service_RightInfo_getUsername

#define arginfo_class_Win32Service_RightInfo_getRights arginfo_class_Win32Service_RightInfo___serialize

ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(arginfo_class_Win32Service_RightInfo_isGrantAccess, 0, 0, _IS_BOOL, 0)
ZEND_END_ARG_INFO()

#define arginfo_class_Win32Service_RightInfo_isDenyAccess arginfo_class_Win32Service_RightInfo_isGrantAccess

