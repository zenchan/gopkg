package uuid

import (
	"encoding/binary"

	guuid "github.com/google/uuid"
)

// UUID returns a random 64-bit unsigned integer uuid
func UUID() uint64 {
	id := guuid.New()
	return binary.BigEndian.Uint64(id[:8])
}
