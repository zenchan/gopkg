package uuid

import "testing"

func TestUUIDUnique(t *testing.T) {
	// 10 million
	cnt := 10000000
	m := make(map[uint64]bool, cnt)
	for i := 0; i < cnt; i++ {
		id := UUID()
		if m[id] {
			t.Fatal("uuid is not unique")
		}
		m[id] = true
	}
}

func BenchmarkUUID(b *testing.B) {
	for i := 0; i < b.N; i++ {
		UUID()
	}
}
