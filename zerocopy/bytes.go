package zerocopy

import "unsafe"

// StringToBytes converts string to []byte with no-copy.
// The caller should not use []byte as a return value.
func StringToBytes(s string) []byte {
	x := (*[2]uintptr)(unsafe.Pointer(&s))
	h := [3]uintptr{x[0], x[1], x[1]}
	return *(*[]byte)(unsafe.Pointer(&h))
}

// BytesToString converts []byte to string with no-copy.
// The caller should not change []byte's value.
func BytesToString(b []byte) string {
	return *(*string)(unsafe.Pointer(&b))
}
