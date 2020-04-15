const db = require('../data/db-config')

module.exports = {
    find,
    findById,
    findSteps,
    add,
    updateScheme,
    remove,
    addStep
}

function find() {
    return db('schemes')
}

function findById(id) {
    return db('schemes')
        .where({ id })
}

function findSteps(id) {
    return db('schemes')
        .select('steps.instructions', 'schemes.scheme_name')
        .join('steps', 'steps.scheme_id', 'schemes.id')
        .where('schemes.id', id)
}

function add(scheme) {
    return db('schemes')
        .insert(scheme)
        .then(([id]) => {
            return findById(id)
        })
}

function updateScheme(changes, id) {
    return db('schemes')
        .where({ id })
        .update(changes)
        .then(() => {
            return findById(id)
        })
}

function remove(id) {
    return db('schemes')
        .where({ id })
        .del()
}

function addStep(step) {
    return db('steps')
        .insert(step)
}