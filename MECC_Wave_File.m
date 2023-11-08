% Ocean Wave Simulation Script

% User input for wave type
disp('Select a wave type:');
disp('1. No Wave');
disp('2. Regular Wave');
disp('3. Irregular Wave');
waveType = input('Enter your choice (1/2/3): ');

% Parameters initialization
height = 0;
period = 0;
spectrumType = '';
option = '';
phaseSeed = 0;
direction = 0;
spread = 0;
time = linspace(0, 10, 1000); % Sample time for visualization

% Fetch parameters based on wave type
switch waveType
    case 1
        % No Wave
        height = input('Enter wave height: ');
        period = input('Enter wave period: ');
        waveData = zeros(size(time)); % No wave, so data is zeros
        
    case 2
        % Regular Wave
        height = input('Enter wave height: ');
        period = input('Enter wave period: ');
        waveData = height * sin(2 * pi * time / period); % Simple sine wave
        
    case 3
        % Irregular Wave
        height = input('Enter wave height: ');
        period = input('Enter wave period: ');
        spectrumType = input('Enter spectrum type (e.g., Pierson-Moskowitz): ', 's');
        option = input('Enter option (e.g., random/seeded): ', 's'); %here is where chaos comes in --> is it as it chooses random numbers it approches a chaotic system  
        if strcmp(option, 'seeded')
            phaseSeed = input('Enter phase seed: ');
        end
        direction = input('Enter wave direction (in degrees): ');
        spread = input('Enter spread (in degrees): ');
        waveData = height * (sin(2 * pi * time / period) + 0.5 * randn(size(time))); % Random wave for visualization
        
    otherwise
        disp('Invalid choice. Exiting.');
        return;
end

% Display the wave simulation
disp('Simulating the wave...');
figure;
plot(time, waveData);
xlabel('Time (s)');
ylabel('Wave Height (m)');
title('Ocean Wave Simulation');
grid on;
disp('Simulation complete.');
