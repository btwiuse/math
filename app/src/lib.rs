#![no_std]

use sails_rs::prelude::*;

mod math;

struct MathService(());

#[sails_rs::service]
impl MathService {
    pub fn new() -> Self {
        Self(())
    }

    pub fn sqrt(&mut self, y: u128) -> u128 {
        math::sqrt(y)
    }

    pub fn min(&mut self, x: u128, y: u128) -> u128 {
        math::min(x, y)
    }
}

pub struct MathProgram(());

#[sails_rs::program]
impl MathProgram {
    // Program's constructor
    pub fn new() -> Self {
        Self(())
    }

    // Exposed service
    pub fn math(&self) -> MathService {
        MathService::new()
    }
}
