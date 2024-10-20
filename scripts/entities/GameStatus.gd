extends Resource
class_name GameStatus

enum Status {
	ONGOING,
	FINISHED,
	PAUSED
}

@export var status: Status = Status.ONGOING
