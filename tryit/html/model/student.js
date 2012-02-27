var Jalen = Jalen || {};

/**
 * @namespace
 */
Jalen.School = Jalen.School || {};


/**
 * @class
 * @constructor
 */ 
Jalen.School.Student = function(name, age) {
	
	/** @type string*/
	this.name = name;

	/** @type number */
	this.age = age;
};

/**
 * Create a new Student Object
 * @return {Jalen.School.Student} Student
 */
Jalen.School.Student.create = function(name, age) {
	return new Jalen.School.Student(name, age);
};
