function result = PSNR(f, g)
	assert(min(min(f)) >= 0);

	max_intensity = max(max(f));
	% assumptions about the max intensity..
	assert(max_intensity <= 255);
	if (max_intensity <= 1)
		max_intensity = 1;
	else
		max_intensity = 255;
	endif

	result = 10*log10( (max_intensity^2) / MSE(f,g) );
end

function result = MSE(f, g)
	assert(size(f)==size(g));
	result = mean2( (f-g) .^ 2 );
end
