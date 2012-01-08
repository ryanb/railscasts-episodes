Delayed::Worker.max_attempts = 5
Delayed::Worker.delay_jobs = !Rails.env.test?
